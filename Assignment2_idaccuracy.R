#作业一

rm(list = ls()) #从R的工作环境中删除所有变量
gc() #从内存中完全删除变量

#使用R中的数据读写，文件路径，for循环语句，读入路径“/assignment_idaccuracy/Aminer”总的所有文件，并将数据合并成为一个data.frame输出
setwd("/Users/wangzifang/Desktop/应用经济学中的大数据分析/assignment/data/assignment_idaccuracy/Aminer/")
aminer_filelist <- list.files()
aminer_data <- data.frame()
for (filename in aminer_filelist){
  add_data <- read.csv(filename, head = TRUE)
  aminer_data <- rbind(aminer_data, add_data)
}
head(aminer_data)
write.csv(aminer_data, "/Users/wangzifang/Desktop/应用经济学中的大数据分析/assignment/data/assignment_idaccuracy/aminer_data.csv")

#使用apply家族函数替代上述步骤中的for循环
aminer_data_list <- lapply(aminer_filelist, read.csv, header = TRUE)
aminer_data_apply <- do.call(rbind, aminer_data_list)
head(aminer_data_apply)

#将2中代码封装成为一个可以在命令行运行的脚本，脚本的唯一一个参数为aminer论文文件所在的路径。
args <- commandArgs(T)
path_data <- as.numeric(args[1])
aminer_filelist <- list.files(path_data)
aminer_data_list <- lapply(aminer_filelist, read.csv, header = TRUE)
aminer_data_apply <- do.call(rbind, aminer_data_list)
#封装该段脚本为 rbind_data.R
#命令行中执行 Rscript rbind_data.R "/Users/wangzifang/Desktop/应用经济学中的大数据分析/data/assignment_idaccuracy/Aminer/"
