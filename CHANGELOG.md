## 0.1.2

### Enhancements
  - Removed worker because at this point is not in use.
  - Applied provider suggestion, `country` is override when `route` is used since route is a mandatory field, `country` is not longer a default.
  - `long_message` is `false` by default to prevent a double SMS charge, hint: `false` is 160 characters long, true is 306 characters long.