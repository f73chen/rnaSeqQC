workflow test_location {
    call find_tools
}

task find_tools {
    command {
        ls $PICARD_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $JAVA_ROOT 
        echo "@@@@@@@@@@@@@@@@"
        ls $PRODUCTION_TOOLS_PYTHON_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $PYTHON_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $BWA_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $BAM_QC_METRICS_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $SAMTOOLS_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $HTSLIB_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $BEDTOOLS_ROOT
        echo "@@@@@@@@@@@@@@@@"

        echo $PATH
        echo "################"
        echo $MANPATH
        echo "################"
        echo $LD_LIBRARY_PATH
        echo "################"
        echo $PYTHONPATH
        echo "################"
        echo $PKG_CONFIG_PATH
        echo "################"
    }
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/rnaseqqc@sha256:9e1796bc05a34d4bf184f3c0682bad098738daefa71120e68a5cd8f295b6b05c"
        modules: "picard/2.21.2 production-tools-python/2 bwa/0.7.17 bam-qc-metrics/0.2.5"
    }
}
