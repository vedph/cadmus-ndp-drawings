# Cadmus NDP Drawings

- [Cadmus models reference](https://myrmex.github.io/overview/cadmus/dev/models/)
- [Cadmus bricks playground](https://cadmus-bricks.fusi-soft.com/)
- [Cadmus NDP FRAC](https://github.com/vedph/cadmus-ndp-frac)
- [Cadmus NDP Books](https://github.com/vedph/cadmus-ndp-books)

In what follows:

- 🟢 marks a [general](https://vedph.github.io/cadmus-doc/models/shared.html#general) or bibliographic part.
- 📖 marks a [codicology](https://vedph.github.io/cadmus-doc/models/shared.html#codicology) part.
- ⭐ marks a new part. The star is used once, even when that part is then reused in other items. If a part marked with a star has a link to documentation, this means that I have already implemented it as I could do this in advance for generic parts. All the other parts are still to be implemented.
- ⚠️ marks an area where the model must still be defined with a discussion.

For items definitions see [this page](https://github.com/vedph/cadmus-ndp-api).

## New Parts

### DrawingTechPart

Technical description of a drawing: material and techniques.

- ⭐ `DrawingTechPart`:
  - `material`\* (📚 `drawing-tech-materials`)
  - `features` (📚 `drawing-tech-features`)
  - `measures` (`PhysicalMeasurement[]`) via [measurements brick](https://github.com/vedph/cadmus-bricks-shell-v3/tree/master/projects/myrmidon/cadmus-mat-physical-size#physicalmeasurementset) (📚 `drawing-tech-size-units`, 📚 `drawing-tech-dim-tags`, 📚 `drawing-tech-measure-names`):
    - `name`\* (`string`)
    - `tag` (`string`)
    - `value`\* (`float`)
    - `unit` (`string`)
  - `techniques` (`string[]` flags: 📚 `drawing-tech-techniques`)
  - `colors` (`string[]` flags: 📚 `drawing-tech-colors`)
  - `note` (`string`)

### Obsoleted Parts

DrawingSetPart: a set of drawings belonging to a single project. Obsoleted, replaced by a set of parts (bindings, decorated counts, flags, references).

- ⭐ `DrawingSetPart`:
  - `material`\* (📚 `drawing-set-materials`)
  - `binding`\* (`string` 📚 `drawing-set-bindings`): bound sheets, once bound sheets, etc.
  - `counts` (`DecoratedCount[]` 📚 `drawing-set-counts-ids`, 📚 `drawing-set-counts-tags`):
    - `id`\* (`string`, 📚 `decorated-count-ids`)
    - `value`\* (`number`)
    - `tag`: (`string`, 📚 `decorated-count-tags`)
    - `note`: (`string`)
  - `features` (`string[]` 📚 `drawing-set-features`)
  - `targets` (`DrawingSetTarget[]`):
    - `citation` (`string`, via brick)
    - `missing` (`boolean`, when any is true, the project is not complete)
  - `note` (`string`)

DrawingTextsPart: replaced with [COD edits part](https://github.com/vedph/cadmus-codicology/blob/master/docs/cod-edits.md).

- ⭐ `DrawingTextsPart`:
  - `texts` (`DrawingText[]`):
    - `types`\* (`string[]` 📚 `drawing-texts-types`: text, comment, other...)
    - `position` (`string`, 📚 `drawing-texts-positions`: the position of the text in the drawing sheet, e.g. recto, verso, etc.)
    - `citation` (`string`, via brick)
    - `script` (📚 `drawing-texts-scripts`)
    - `value` (`string`)
    - `author` (`AssertedId[]` see [AssertedCompositeId](https://github.com/vedph/cadmus-bricks-shell-v3/blob/master/projects/myrmidon/cadmus-refs-asserted-ids/README.md#asserted-composite-id)): `tag` can be used for his role (stesso autore disegno etc).
    - `date` ([HistoricalDate](https://github.com/vedph/cadmus-bricks-shell-v3/blob/master/projects/myrmidon/cadmus-refs-historical-date/README.md))

## History

### 1.0.0

- 2025-11-24: ⚠️ upgraded to NET 10.

### 0.0.2

-  2025-10-08: updated packages.

### 0.0.1

- 2025-09-24: initial release.
