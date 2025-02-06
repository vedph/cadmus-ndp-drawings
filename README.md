﻿# Cadmus NDP Drawings

- [Cadmus models reference](https://myrmex.github.io/overview/cadmus/dev/models/)
- [Cadmus bricks playground](https://cadmus-bricks.fusi-soft.com/)
- [Cadmus NDP FRAC](https://github.com/vedph/cadmus-ndp-frac)
- [Cadmus NDP Books](https://github.com/vedph/cadmus-ndp-books)

In what follows:

- 🟢 marks a [general](https://vedph.github.io/cadmus-doc/models/shared.html#general) or bibliographic part.
- 📖 marks a [codicology](https://vedph.github.io/cadmus-doc/models/shared.html#codicology) part.
- ⭐ marks a new part. The star is used once, even when that part is then reused in other items. If a part marked with a star has a link to documentation, this means that I have already implemented it as I could do this in advance for generic parts. All the other parts are still to be implemented.
- ⚠️ marks an area where the model must still be defined with a discussion.

```mermaid
graph LR;

PROJECT --> identity
identity --> metadata
identity --> external-ids
identity --> cod_shelfmarks
identity --> district-location
identity --> pin-links:auth
identity --> pin-links
PROJECT --> content
content --> drawing-set
content --> comment
content --> note
PROJECT --> support
support --> cod_bindings
support --> physical-states
support --> events
PROJECT --> editorial
editorial --> ext-bibliography
editorial --> note:fort
```

```mermaid
graph LR;

DRAWING --> identity
identity --> metadata
identity --> external-ids
identity --> cod_shelfmarks
identity --> pin-links:auth
DRAWING --> content
content --> drawing-texts
content --> collector-notes
DRAWING --> support
support --> drawing-tech
support --> cod_watermarks
support --> physical-states
support --> events
DRAWING --> editorial
editorial --> ext-bibliography
editorial --> note:fort
```

## New Parts

### CollectorNotesPart

Collector notes on the support.

- ⭐ `CollectorNotesPart`:
  - `notes` (`CollectorNote[]`):
    - `type` (📚 `collector-note-type`: text, stamp, label...)
    - `position` (📚 `collector-note-positions`: top, bottom...)
    - `date` ([HistoricalDate](https://github.com/vedph/cadmus-bricks-shell-v3/blob/master/projects/myrmidon/cadmus-refs-historical-date/README.md))
    - `note` (`string`)

### DrawingSetPart

A set of drawings belonging to a single project.

- ⭐ `DrawingSetPart`:
  - `material` (📚 `drawing-set-materials`)
  - `bound` (`boolean`): true if drawings are bound.
  - [decorated counts brick](https://github.com/vedph/cadmus-bricks-shell-v3/blob/master/projects/myrmidon/cadmus-refs-decorated-counts/README.md) (📚 `drawing-set-counts-ids`, 📚 `drawing-set-counts-tags`)
  - `features` (`string[]` 📚 `drawing-set-features`)
  - `targets` (`DrawingSetTarget[]`):
    - `citation` (`string`, via brick)
    - `missing` (`boolean`, when any is true, the project is not complete)
  - `note` (`string`)

### DrawingTechPart

Technical description of a drawing: material and techniques.

- ⭐ `DrawingTechPart`:
  - `material` (📚 `drawing-tech-materials`)
  - `note` (`string`)
  - `features` (📚 `drawing-tech-features`)
  - [measurements brick](https://github.com/vedph/cadmus-bricks-shell-v3/tree/master/projects/myrmidon/cadmus-mat-physical-size#physicalmeasurementset) (📚 `drawing-tech-size-units`, 📚 `drawing-tech-dim-tags`, 📚 `drawing-tech-set-names`)
  - `techniques` (`string[]` flags: 📚 `drawing-tech-techniques`)
  - `watercolors` (`string[]` flags: 📚 `drawing-tech-watercolors`); if any is present then "acquerellature" is implied.

### DrawingTextsPart

- ⭐ `DrawingTextsPart`:
  - `texts` (`DrawingText[]`):
    - `type`\* (📚 `drawing-texts-types`: text, comment, other...)
    - `citation` (`string`, via brick)
    - `script` (📚 `drawing-texts-scripts`)
    - `value` (`string`)
    - `author` ([AssertedCompositeId](https://github.com/vedph/cadmus-bricks-shell-v3/blob/master/projects/myrmidon/cadmus-refs-asserted-ids/README.md#asserted-composite-id)): `tag` can be used for his role (stesso autore disegno etc).
    - `date` ([HistoricalDate](https://github.com/vedph/cadmus-bricks-shell-v3/blob/master/projects/myrmidon/cadmus-refs-historical-date/README.md))

## Project Item

- identity:
  - 🟢 [MetadataPart](https://github.com/vedph/cadmus-general/blob/master/docs/metadata.md)
  - 🟢 [ExternalIdsPart](https://github.com/vedph/cadmus-general/blob/master/docs/external-ids.md)
  - 📖 [CodShelfmarksPart](https://github.com/vedph/cadmus-codicology/blob/master/docs/cod-shelfmarks.md)
  - 🟢 [DistrictLocationPart](https://github.com/vedph/cadmus-general/blob/master/docs/district-location.md) for production area
  - 🟢 [PinLinksPart](https://github.com/vedph/cadmus-general/blob/master/docs/fr.pin-links.md):`auth` for authors. This has label, gid, scope, tag, assertion for each author.
  - 🟢 [PinLinksPart](https://github.com/vedph/cadmus-general/blob/master/docs/fr.pin-links.md) for links to other items like mss etc.

- content:
  - ⭐ [DrawingSetPart](#drawingsetpart)
  - 🟢 [CommentPart](https://github.com/vedph/cadmus-general/blob/master/docs/comment.md) for description
  - 🟢 [NotePart](https://github.com/vedph/cadmus-general/blob/master/docs/note.md)

- support:
  - 📖 [CodBindingsPart](https://github.com/vedph/cadmus-codicology/blob/master/docs/cod-bindings.md)
  - 🟢 [PhysicalStatesPart](https://github.com/vedph/cadmus-general/blob/master/docs/physical-states.md): type, features, date, note
  - 🟢 [HistoricalEventsPart](https://github.com/vedph/cadmus-general/blob/master/docs/historical-events.md)

- editorial:
  - 🟢 [ExtBibliographyPart](https://github.com/vedph/cadmus-general/blob/master/docs/ext-bibliography.md)
  - 🟢 [NotePart](https://github.com/vedph/cadmus-general/blob/master/docs/note.md):`fort`: "fortuna critica".

## Drawing Item

- identity:
  - 🟢 [MetadataPart](https://github.com/vedph/cadmus-general/blob/master/docs/metadata.md)
  - 🟢 [ExternalIdsPart](https://github.com/vedph/cadmus-general/blob/master/docs/external-ids.md)
  - 📖 [CodShelfmarksPart](https://github.com/vedph/cadmus-codicology/blob/master/docs/cod-shelfmarks.md)
  - [PinLinksPart](https://github.com/vedph/cadmus-general/blob/master/docs/fr.pin-links.md):`auth` for authors.
- content:
  - ⭐ [DrawingTextsPart](#drawingtextspart)
  - ⭐ [CollectorNotesPart](#collectornotespart)
  - [NotePart](https://github.com/vedph/cadmus-general/blob/master/docs/note.md):`instr` istruzioni realizzazione
- support:
  - ⭐ [DrawingTechPart](#drawingtechpart)
  - 📖 [CodWatermarksPart](https://github.com/vedph/cadmus-codicology/blob/master/docs/cod-watermarks.md)
  - 🟢 [PhysicalStatesPart](https://github.com/vedph/cadmus-general/blob/master/docs/physical-states.md): type, features, date, note
  - 🟢 [HistoricalEventsPart](https://github.com/vedph/cadmus-general/blob/master/docs/historical-events.md)
- editorial:
  - 🟢 [ExtBibliographyPart](https://github.com/vedph/cadmus-general/blob/master/docs/ext-bibliography.md)
  - 🟢 [NotePart](https://github.com/vedph/cadmus-general/blob/master/docs/note.md):`fort`: "fortuna critica".

- iconography part: ❓ to be defined as cross-project.
