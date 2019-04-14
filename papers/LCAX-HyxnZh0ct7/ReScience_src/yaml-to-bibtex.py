#! /usr/bin/env python3
# ReScience yaml to bibtex converter
# Released under the BSD two-clauses licence

def generate_bibtex(filename, article):
    content = (
        "@Article {{{_.authors[0].lastname}:{_.date_published.year},\n"
        "  author =       {{{_.authors_full}}},\n"
        "  title =        {{{{{_.title}}}}},\n"
        "  journal =      {{{_.journal_name}}},\n"
        "  year =         {{{_.date_published.year}}},\n"
        "  month =        {{{_.date_published.month}}},\n"
        "  volume =       {{{_.journal_volume}}},\n"
        "  number =       {{{_.journal_issue}}},\n"
        "  pages =        {{{_.article_number}}},\n"
        "  doi =          {{{_.article_doi}}},\n"
        "  url =          {{{_.article_url}}},\n"
        "  code_url =     {{{_.code.url}}},\n"
        "  code_doi =     {{{_.code.doi}}},\n"
        "  data_url =     {{{_.data.url}}},\n"
        "  data_doi =     {{{_.data.doi}}},\n"
        "  review_url =   {{{_.review.url}}},\n"
        "  type =         {{{_.type}}},\n"
        "  language =     {{{_.language}}},\n"
        "  domain =       {{{_.domain}}},\n"
        "  keywords =     {{{_.keywords}}}\n"
        "}}".format(filename=filename, _=article))

    return content



# -----------------------------------------------------------------------------
if __name__ == '__main__':
    import argparse
    from article import Article

    parser = argparse.ArgumentParser(description='YAML to bibtex converter.')
    parser.add_argument('--input', '-i', dest='filename_in', action='store',
                        default="metadata.yaml", help='input YAML file')
    parser.add_argument('--output', "-o", dest='filename_out', action='store',
                        help='output bibtex file')
    args = parser.parse_args()
    filename_in  = args.filename_in
    filename_out = args.filename_out

    # print("Generating bibtex entry ({1}) from {0}".format(filename_in, filename_out))
    
    with open(filename_in, "r") as file:
        article = Article(file.read())

    if len(article.authors) > 0:
        content = generate_bibtex(filename_in, article)
        if filename_out is not None:
            with open(filename_out, "w") as file:
                file.write(content)
        else:
            print(content)
    else:
        print("Error! No author found.")

