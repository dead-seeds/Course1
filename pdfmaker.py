import os
import img2pdf
from pypdf import PdfWriter, PdfReader
import sys

def rmdir(dirpath):
    listdir = os.listdir(dirpath)
    for filename in listdir:
        os.remove(dirpath + '/' + filename)
    os.rmdir(dirpath)

dirslist = sys.argv[1:]
print(sys.argv)
for dirname in dirslist:
    os.makedirs(dirname + '_pdf_files')
    dir = './' + dirname
    dirlist = os.listdir(dir)
    for name in dirlist:
        curdir = dir + '/' + name
        cur_dir_list = os.listdir(curdir)
        for filename in cur_dir_list:
            if len(filename) == 5:
                image = open(curdir + '/' + filename, 'rb')
                newimage = open(curdir + '/0' + filename, 'wb')
                newimage.write(image.read())
                image.close()
                newimage.close()
                os.remove(curdir + '/' + filename)
    for name in dirlist:
        #curpdf = open('./Notes/' + name + '.pdf', 'wb')
        curdir = dir + '/' + name
        cur_pdf_dir = dir + '/pdf_' + name
        cur_dir_list = os.listdir(curdir)
        cur_pdf_filename = name + '.pdf'
        #cur_pdf_file = open(dir + '/' + cur_pdf_filename, 'wb')
        os.makedirs(cur_pdf_dir) 
        merger = PdfWriter()
        for filename in cur_dir_list:
            image = open(curdir + '/' + filename, 'rb')
            pdf_img = open(cur_pdf_dir + '/' + filename[:-3] + 'pdf', 'wb')
            pdf_img.write(img2pdf.convert(image))
            pdf_img.close()
            merger.append(PdfReader(cur_pdf_dir + '/' + filename[:-3] + 'pdf') )
            print(cur_pdf_dir + '/' + filename[:-3] + 'pdf')
        merger.write(dirname + '_pdf_files' + '/' + cur_pdf_filename)
        merger.close()
    for name in dirlist:
        rmdir(dir + '/pdf_' + name)
        

