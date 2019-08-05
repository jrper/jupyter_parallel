FROM jupyter/scipy-notebook:6c3390a9292e

USER root
RUN apt update && apt install -y libopenmpi-dev openmpi-common ssh

USER jovyan

RUN pip install ipyparallel mpi4py
RUN mkdir -p $HOME/.ipython/profile_mpi
RUN echo "c.IPClusterEngines.engine_launcher_class = 'MPIEngineSetLauncher'" > $HOME/.ipython/profile_mpi/ipcluster_config.py

COPY ParallelExecution.ipynb ${HOME}
COPY psum.py ${HOME}



