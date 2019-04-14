### [ReScience C](https://rescience-c.github.io/) article template

This repository contains the Latex (optional) template for writing a ReScience
C article and the (mandatory) YAML metadata file. For the actual article,
you're free to use any software you like as long as you enforce the proposed
PDF style. For the fonts, you'll need:

* [Source Serif Pro (Adobe Systems)](https://github.com/adobe-fonts/source-serif-pro) by F. Grießhammer. 
* [The Roboto family of fonts (Google)](https://github.com/google/roboto) by C. Robertson.
* [Source Code Pro (Adobe Systems)](https://github.com/adobe-fonts/source-code-pro) by P.D. Hunt.

The fonts are available for [download from Google Fonts](https://fonts.google.com/selection?selection.family=Roboto|Roboto+Condensed|Roboto+Mono|Roboto+Slab|Source+Code+Pro|Source+Serif+Pro&query=source+code+pro).

A tool is available for the latex template that produces latex definitions from
the metadata file. If you use another software, make sure that metadata and PDF
are always synced.


#### Usage

For a submission, fill in information in
[metadata-draft.yaml](./metadata-draft.yaml), modify [content.tex](content.tex)
and type:

```bash
$ make draft
```

After acceptance, fill in [metadata-final.yaml](./metadata-final.yaml) and type:

```bash
$ make final
```

