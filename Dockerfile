#FROM  continuumio/miniconda3:4.8.2-alpine 

FROM  continuumio/miniconda3:4.8.2 

RUN conda create --name pymtc python=3.6 -y

SHELL ["conda", "run", "-n", "pymtc", "/bin/bash", "-c"]

RUN pip install crisprbuilder_tb

RUN conda install -c bioconda parallel-fastq-dump blast -y

RUN conda install -c kantorlab blastn -y

ENTRYPOINT ["conda", "run", "-n", "pymtc", "python", "-m", "crisprbuilder_tb"]


# Usage
# Build the docker image like so
# docker build -d crisprbuilder_tb ./Dockerfile
# docker run crisprbuilder_tb --collect ERR2704808
