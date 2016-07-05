task MarkDuplicates {
  String gatk_home
  String input_bam
  String output_bam
  String metrics_filename

  command {
    ${gatk_home}/gatk-launch \
      MarkDuplicatesSpark \
      --input ${input_bam} \
      --output ${output_bam} \
      --METRICS_FILE ${metrics_filename} \
      -- \
      --sparkRunner SPARK --sparkMaster yarn-client \
      --driver-memory 3G \
      --num-executors 1 \
      --executor-cores 1 \
      --executor-memory 3G
  }
  output {
    File duplicate_metrics = "${metrics_filename}"
  }
}

workflow MarkDuplicatesWorkflow {
  call MarkDuplicates
}
