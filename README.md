# pandoc

Pet project to create PDF documents from markdown files using pandoc. See the `./template` folder for an example. Uses the Latex Eisvogel template.

See and example [PDF document](./template/notes.pdf) here.

## Usage

Copy the files from the `./template` folder, update the `MD_NAME` value in the `Makefile` from `notes` to the filename matching your Markdown file:

```make, Makefile
MD_NAME = notes # Update this value to match your markdown file
```

Run `make` create a PDF file or `make help` to see the available commands.
