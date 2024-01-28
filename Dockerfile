# This assumes the container is running on a system with a CUDA GPU
FROM tensorflow/tensorflow:latest-gpu

WORKDIR /tf-work-directories

RUN pip install -U jupyter pandas matplotlib tensorflow-hub scikit-learn
RUN pip install opencv-python-headless
RUN pip install seaborn

# Plotting in Tensorflow needs this
RUN pip install pydot
RUN apt-get update && \
    apt-get install -y graphviz && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8888
EXPOSE 6006

ENTRYPOINT ["jupyter", "notebook","--ip=0.0.0.0","--allow-root","--no-browser"]
