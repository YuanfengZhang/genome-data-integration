#Split solid merged  bam file by chrom and add read groups for GATK
#bam files generated by NHGRI and available at: ftp://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/NHGRI_Illumina300X_novoalign_bams/HG001.hs37d5.300x.bam and ....bai
#Note that we do this in 3 separate processes on DNAnexus to parallelize, but this isn't required as long as there is sufficient disk space (~1.2TB)
#Sorted mappings (sorted_bam): HG001.hs37d5.300x_novoalign.bam
#Sorted mappings index (index_bai): HG001.hs37d5.300x_novoalign.bai
#Read group ID (rgid): 1
#Read group LB (rglb): all
#Read group PL (rgpl): solid
#Read group PU (rgpu): all
#Read group SM (rgsm): NA12878
#Output examples for first 3 chrom's:

#Takes approximately 3-4 hours per command
#Ran on 4/20/16  -- problems with MT chromosome length when Running GATK.  See 4/21 DNAnexus log.
#dx run -y GIAB:/Workflow/samtools_splitchrom_addrg_1to5 -isorted_bam=HG001_hg19_solid5500_SE75bp.bam -iindex_bai=HG001_hg19_solid5500_SE75bp.bam.bai -irgid=1 -irglb=all -irgpl=solid -irgpu=all -irgsm=NA12878 
#dx run -y GIAB:/Workflow/samtools_splitchrom_addrg_6to12 -isorted_bam=HG001_hg19_solid5500_SE75bp.bam -iindex_bai=HG001_hg19_solid5500_SE75bp.bam.bai -irgid=1 -irglb=all -irgpl=solid -irgpu=all -irgsm=NA12878 
#dx run -y GIAB:/Workflow/samtools_splitchrom_addrg_13toMT -isorted_bam=HG001_hg19_solid5500_SE75bp.bam -iindex_bai=HG001_hg19_solid5500_SE75bp.bam.bai -irgid=1 -irglb=all -irgpl=solid -irgpu=all -irgsm=NA12878 

#New applet incorporating picard reordering, see 4/21 DNAnexus log for details
#Ran 4/21/16
dx run -y GIAB:/Workflow/samtools_splitchrom_addrg_reord_1to5 -isorted_bam=HG001_hg19_solid5500_SE75bp.bam -iindex_bai=HG001_hg19_solid5500_SE75bp.bam.bai -irgid=1 -irglb=all -irgpl=solid -irgpu=all -irgsm=NA12878 
dx run -y GIAB:/Workflow/samtools_splitchrom_addrg_reord_6to12 -isorted_bam=HG001_hg19_solid5500_SE75bp.bam -iindex_bai=HG001_hg19_solid5500_SE75bp.bam.bai -irgid=1 -irglb=all -irgpl=solid -irgpu=all -irgsm=NA12878 
dx run -y GIAB:/Workflow/samtools_splitchrom_addrg_reord_13toMT -isorted_bam=HG001_hg19_solid5500_SE75bp.bam -iindex_bai=HG001_hg19_solid5500_SE75bp.bam.bai -irgid=1 -irglb=all -irgpl=solid -irgpu=all -irgsm=NA12878 
