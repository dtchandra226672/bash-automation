# create network mapping of network server on local machine using shell in linux/macos

# create dir to contain the drive mapping from the network
mkdir ~/network-files

# sign in with the Guest user account to the file server IP address (public user id)
mount_smbfs //Guest@192.168.46.242/Public ~/network-files    
# mount_smbfs //username:password@192.168.46.242/username ~/network-files

# for unmounting mapped drive
    # umount ~/network-files


cd ~/network-files/Samsung/SDCardCamera
find . -iname '*(*' | wc -l                                             # count the number of files that meets the find parameters
find . -iname '*(*' | sort > output.txt                                 # list out the found files into a text file
cat output.txt | sed "s/(0)//g" | sed 's|^\./||' > output_sorted.txt    # remove the trailing suffixes of all the listed filenames


mkdir ~/network-files/Samsung/duplicates                                # create new folder to contain the duplicates 
find . -iname '*(*' -exec cp {} ~/network-files/Samsung/duplicates \;   # copy all the duplicates to the created folder

# the following script is used for copying the files with same pattern, but without the suffixes
# we have removed the unnecessary letters using the previous sed cmdlet
    # while read filenames; do
    #     find ~/network-files/Samsung/SDCardCamera/ -name "$filename" =exec cp {} ~/network-files/Samsung/duplicates \;
    # done < output_sorted.txt


# when you finish your work (unblur by cmd + /)
    # umount ~/network-files
    # rm -r ~/network-files