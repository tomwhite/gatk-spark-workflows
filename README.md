Experimental [WDL](https://software.broadinstitute.org/wdl/) workflows for running
[GATK4](https://github.com/broadinstitute/gatk) on Spark.

We use [Cromwell](https://github.com/broadinstitute/cromwell) with the local backend to
submit the workflow to Spark.

# Running

You need a cluster with Spark installed, e.g. CDH 5.7.0.

First clone this repository.

```
git clone https://github.com/tomwhite/gatk-spark-workflows
cd gatk-spark-workflows
```

Copy a small BAM file for testing into HDFS:

```
hadoop fs -put data/CEUTrio.HiSeq.WGS.b37.ch20.1m-1m1k.NA128782.bam bam/CEUTrio.HiSeq.WGS.b37.ch20.1m-1m1k.NA12878.bam
```

Edit _MarkDuplicatesInputs.json_ to reflect your local paths.

Now download the Cromwell JAR:

```
wget https://github.com/broadinstitute/cromwell/releases/download/0.19.3/cromwell-0.19.jar
```

Finally, run the workflow.

```
java -jar cromwell-0.19.jar run MarkDuplicates.wdl MarkDuplicatesInputs.json
```

The output should be visible in HDFS:

```
hadoop fs -ls out/markdups
```

