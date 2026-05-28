# Reporting and Exports

## Supported Reports

- Sales summary
- Top products
- Promotion performance
- Inventory KPIs

## Export Flow

- Export requests create a `ReportExport` record in `PENDING`.
- The `report-export` worker transitions the record to `PROCESSING`, generates a CSV file, and stores the resulting local object key in `resultObjectKey`.
- Failures are recorded on the `ReportExport` row through `status=FAILED` and `failureReason`.

## Audit and Privacy

- Admin audit browsing redacts sensitive JSON keys before returning metadata or diffs.
- Reporting endpoints aggregate operational data only and do not expose payment secrets or raw credential material.
