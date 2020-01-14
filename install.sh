
# conda create --name maskrcnn_benchmark python=3.7
# conda activate maskrcnn_benchmark

# this installs the right pip and dependencies for the fresh python
conda install ipython
git clone https://github.com/NVIDIA/apex
pip install ./apex
pip install ninja yacs cython matplotlib tqdm opencv-python

conda install pytorch==1.0.1 torchvision==0.2.2 cudatoolkit=10.0 -c pytorch

export INSTALL_DIR=$PWD

# install pycocotools
cd $INSTALL_DIR
git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
python setup.py build_ext install

# install PyTorch Detection
cd $INSTALL_DIR
git clone https://github.com/facebookresearch/maskrcnn-benchmark.git
cd maskrcnn-benchmark

python setup.py build develop


unset INSTALL_DIR

# Download dataset 
mkdir -p data
cd data 
wget http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar
tar -xvf VOCtrainval_11-May-2012.tar

# create coco
python tools/voc2coco.py