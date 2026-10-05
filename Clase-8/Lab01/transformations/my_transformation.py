# Importaciones del pipeline (API moderna)
# IMPORTANTE: NO usar 'import dlt' (legacy). La API actual es pyspark.pipelines.

from pyspark import pipelines as dp
from pyspark.sql import functions as F

@dp.table(
    name="dbassociate.bronze.ventas",
    comment="Ingesta cruda de ventas diarias desde el Volume.",
    table_properties={"quality": "bronze"},
)
def bronze_ventas():
    return (
        spark.readStream
            .format("cloudFiles")
            .option("cloudFiles.format", "csv")
            .option("header", "true")
            .option("cloudFiles.schemaLocation",
                    "/Volumes/dbassociate/default/vol_landing/session08/_schemas/bronze_ventas")
            .load("/Volumes/dbassociate/default/vol_landing/session08/ventas/")
            .withColumn("_ingested_at", F.current_timestamp())
            .withColumn("_source_file", F.col("_metadata.file_path"))
    )