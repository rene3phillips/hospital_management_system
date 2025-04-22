# Database Normalization

## First Normal Form (1NF)
In the initial stage, the data for patients, doctors, billing, etc. was combined into a single table, which resulted in redundancy and repeating groups. This structure made it difficult to maintain and update the data, as changes would need to be applied in multiple places. To satisfy 1NF, I ensured that each column contained atomic values (no multiple values in a single field) and removed repeating groups by splitting the data into separate tables for patients, doctors, billing, etc.

## Second Normal Form (2NF)
For 2NF, the goal is to eliminate partial dependencies, ensuring that non-key attributes depend entirely on the primary key. Since the tables from 1NF already have single-column primary keys and no partial dependencies, they naturally conform to 2NF, and no further splitting of data was required.

## Third Normal Form (3NF)
To achieve 3NF, the goal is to eliminate any transitive dependencies, where non-key attributes depend on other non-key attributes. In simpler terms, every non-key attribute must depend only on the primary key. For example, if you have a patient's name and their billing information in the same table, and if billing details depend on the patient rather than the patient’s ID, that would be a transitive dependency. To resolve this, such information would be separated into its own table. This ensures that each piece of data is directly related to the primary key and avoids redundancy.