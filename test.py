from model.hourglass_net import Stacked_Hourglass

block_number = 8
layers = 3
lr = 0.0001
out_dim = 256
point_num = 14
maxepoch = 10001

image_path = 'D:\\CS\\机器学习大作业\\Pose-Detection\\data_set\\images_padding\\'
label_path = 'D:\\CS\\机器学习大作业\\Pose-Detection\\data_set\\label\\'
batch_size = 1


model = Stacked_Hourglass(block_number=block_number, layers=layers, out_dim=out_dim, point_num=point_num, lr=lr, training=False)
model.test(image_path, label_path)