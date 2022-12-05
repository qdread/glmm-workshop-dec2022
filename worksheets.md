---
layout: page
title: Worksheets and Example Datasets
---

Here are instructions/links for accessing the worksheets and example datasets in Posit Cloud RStudio or for downloading the worksheets and example datasets locally if you are using your own copy of RStudio.

I recommend saving a copy of the worksheets when you start to fill them out in case you want to start over again at some point. But if you need to, you can always download the unfilled worksheets again.

## If you are using Posit Cloud to access RStudio

When you open the "Lessons" project, you will see folders called `datasets` and `worksheets` in the "Files" tab of the lower right pane of the RStudio window. You can click on those folders to browse through them and open the files. There is no need to download anything. (You still might want to save a separate copy of the worksheets when you start to fill them out.)

This is what the files tab should look like:

![files tab]({{ '/public/images/files_tab.png' | relative_url }})

## If you are running RStudio locally

You will need to download the datasets and worksheets. Here they are as .zip files:

[datasets.zip]({{ '/public/datasets.zip' | relative_url }}){: .biglink }  
[worksheets.zip]({{ '/public/worksheets.zip' | relative_url }}){: .biglink }

Unzip these two zip archives on your local filesystem. You will end up with a directory called `datasets` and another called `worksheets`. 

> You will need to modify the code in the lessons wherever it says `read_csv('datasets/file.csv')` to the location on your machine. For example if you unzipped the `datasets.zip` archive into the folder `C:/Users/yourname/Documents/Rworkshop`, then you will need to enter `read_csv('C:/Users/yourname/Documents/Rworkshop/datasets/file.csv')`. Notice that the forward slash `/` is used even on Windows.