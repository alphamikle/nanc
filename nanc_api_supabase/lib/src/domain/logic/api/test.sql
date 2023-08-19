
        DO $$
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'table_with_numbers') THEN
                -- CREATING NEW TABLE BLOCK
                CREATE TABLE "table_with_numbers" (
                    "id" uuid PRIMARY KEY NOT NULL ,
"signed_bit" bit(1)  NULL ,
"signed_float" float4  NULL ,
"unsigned_float" float8  NULL CONSTRAINT "unsigned_float_unsigned_float_nanc_constraint" CHECK ("unsigned_float" >= 0),
"unsigned_double" float8  NULL
                );
                ALTER TABLE "table_with_numbers"
                ENABLE ROW LEVEL SECURITY;
            ELSE
                -- ALTERING EXISTED TABLE BLOCK
                        IF NOT EXISTS (
            SELECT 1
            FROM information_schema.columns
            WHERE table_name = 'table_with_numbers'
            AND column_name = 'id'
        ) THEN
            ALTER TABLE "table_with_numbers"
            ADD COLUMN "id" uuid NOT NULL;
            ELSE
              ALTER TABLE "table_with_numbers"
              ALTER COLUMN "id" SET DATA TYPE uuid USING "id"::uuid,
              ALTER COLUMN "id" SET NOT NULL;
        END IF;

                    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.columns
            WHERE table_name = 'table_with_numbers'
            AND column_name = 'signed_bit'
        ) THEN
            ALTER TABLE "table_with_numbers"
            ADD COLUMN "signed_bit" bit(1) NULL;
            ELSE
              ALTER TABLE "table_with_numbers"
              ALTER COLUMN "signed_bit" SET DATA TYPE bit(1) USING "signed_bit"::bit(1),
              ALTER COLUMN "signed_bit" DROP NOT NULL;
        END IF;

                    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.columns
            WHERE table_name = 'table_with_numbers'
            AND column_name = 'signed_float'
        ) THEN
            ALTER TABLE "table_with_numbers"
            ADD COLUMN "signed_float" float4 NULL;
            ELSE
              ALTER TABLE "table_with_numbers"
              ALTER COLUMN "signed_float" SET DATA TYPE float4 USING "signed_float"::float4,
              ALTER COLUMN "signed_float" DROP NOT NULL;
        END IF;

                    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.columns
            WHERE table_name = 'table_with_numbers'
            AND column_name = 'unsigned_float'
        ) THEN
            ALTER TABLE "table_with_numbers"
            ADD COLUMN "unsigned_float" float8 NULL;
            ELSE
              ALTER TABLE "table_with_numbers"
              ALTER COLUMN "unsigned_float" SET DATA TYPE float8 USING "unsigned_float"::float8,
              ALTER COLUMN "unsigned_float" DROP NOT NULL;
        END IF;

                    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.columns
            WHERE table_name = 'table_with_numbers'
            AND column_name = 'unsigned_double'
        ) THEN
            ALTER TABLE "table_with_numbers"
            ADD COLUMN "unsigned_double" float8 NULL;
            ELSE
              ALTER TABLE "table_with_numbers"
              ALTER COLUMN "unsigned_double" SET DATA TYPE float8 USING "unsigned_double"::float8,
              ALTER COLUMN "unsigned_double" DROP NOT NULL;
        END IF;

            END IF;
            -- CONSTRAINTS BLOCK START
                        EXECUTE (
              SELECT format('ALTER TABLE %s DROP CONSTRAINT IF EXISTS %s', conrelid::regclass, conname)
              FROM   pg_constraint con
              JOIN   pg_attribute a ON a.attnum = ANY(con.conkey)
              WHERE  conname LIKE '%_nanc_constraint' AND a.attname = 'signed_bit'
              LIMIT  1
           );

                        EXECUTE (
              SELECT format('ALTER TABLE %s DROP CONSTRAINT IF EXISTS %s', conrelid::regclass, conname)
              FROM   pg_constraint con
              JOIN   pg_attribute a ON a.attnum = ANY(con.conkey)
              WHERE  conname LIKE '%_nanc_constraint' AND a.attname = 'signed_float'
              LIMIT  1
           );

                        EXECUTE (
              SELECT format('ALTER TABLE %s DROP CONSTRAINT IF EXISTS %s', conrelid::regclass, conname)
              FROM   pg_constraint con
              JOIN   pg_attribute a ON a.attnum = ANY(con.conkey)
              WHERE  conname LIKE '%_nanc_constraint' AND a.attname = 'unsigned_float'
              LIMIT  1
           );

                          IF NOT EXISTS (
                  SELECT 1
                  FROM pg_constraint
                  WHERE conrelid = 'table_with_numbers'::regclass::oid
                    AND conname = 'unsigned_float_unsigned_float_nanc_constraint'
              ) THEN
                  ALTER TABLE "table_with_numbers"
                  ADD CONSTRAINT "unsigned_float_unsigned_float_nanc_constraint" CHECK ("unsigned_float" >= 0);
              END IF;

                        EXECUTE (
              SELECT format('ALTER TABLE %s DROP CONSTRAINT IF EXISTS %s', conrelid::regclass, conname)
              FROM   pg_constraint con
              JOIN   pg_attribute a ON a.attnum = ANY(con.conkey)
              WHERE  conname LIKE '%_nanc_constraint' AND a.attname = 'unsigned_double'
              LIMIT  1
           );

            -- CONSTRAINTS BLOCK END




        END $$;

      COMMIT;
    