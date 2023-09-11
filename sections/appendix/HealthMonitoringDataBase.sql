BEGIN TRANSACTION;

--DROP TABLE IF EXISTS "LabelList";

CREATE TABLE IF NOT EXISTS "LabelList" (
       "LabelID"    INTEGER UNIQUE,
       "tReading"   TEXT,
       "dwSensorIndex"     INTEGER,
       "SensorName" TEXT,
       "dwReadingID"       INTEGER,
       "szLabelUser"       TEXT,
       "szUnit"     TEXT,
       PRIMARY KEY("LabelID")
);

CREATE TABLE IF NOT EXISTS "TempReadings" (
       "LabelID" INTEGER,
       "Value"      REAL,
       "TimeStamp" INTEGER,
       FOREIGN KEY ("LabelID") REFERENCES "LabelList"("LabelID")
);

CREATE TABLE IF NOT EXISTS "LoadReadings" (
       "LabelID" INTEGER,
       "Value"      REAL,
       "TimeStamp" INTEGER,
       FOREIGN KEY ("LabelID") REFERENCES "LabelList"("LabelID")
);

CREATE TABLE IF NOT EXISTS "EventReadings" (
       "LabelID" INTEGER,
       "Event"      Bool,
       "TimeStamp" INTEGER,
       FOREIGN KEY ("LabelID") REFERENCES "LabelList"("LabelID")
);

CREATE TABLE IF NOT EXISTS "OtherReadings" (
       "LabelID" INTEGER,
       "Value"      REAL,
       "TimeStamp" INTEGER,
       FOREIGN KEY ("LabelID") REFERENCES "LabelList"("LabelID")
);

CREATE TABLE IF NOT EXISTS "SystemStatus" (
       "Status" TEXT,
       "Score" REAL,
       "Value" INTEGER,
       "TimeStampStart" INTEGER,
       "TimeStampStop" INTEGER
);

CREATE TABLE IF NOT EXISTS "SystemMTBF" (
       "Status" TEXT,
       "Score" REAL,
       "Value" INTEGER,
       "TimeStampStart" INTEGER,
       "TimeStampStop" INTEGER
);

CREATE TABLE IF NOT EXISTS "HistorySystemStatus" (
       "Optimal" REAL,
       "Elevated" REAL,
       "Critical" REAL,
       "From" INTEGER,
       "To" INTEGER
);

CREATE TABLE IF NOT EXISTS "SystemReliability" (
    "Reliability" REAL,
    "TimeStamp" INTEGER
);

INSERT INTO "SystemReliability" ("Reliability", "TimeStamp")
SELECT 100, 0
WHERE NOT EXISTS (SELECT 1 FROM "SystemReliability");
DROP TABLE IF EXISTS "SensorList";

CREATE TABLE IF NOT EXISTS "SensorList" (
       "dwSensorID" INTEGER,
       "dwSensorInst" INTEGER,
       "szSensorNameOrig" TEXT,
       "szSensorNameUser" TEXT,
       "dwSensorIndex" INTEGER
);
COMMIT;