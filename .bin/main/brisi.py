#!/bin/python
from subprocess import call


def create_lst():
    # create list of installed packeges
    command = call("yay -Qqe > installed.txt", shell=True)
    if not command:
        # 0 success 1 error
        print("Created list of packages to be removed")
    else:
        print("ERORR: Something went wrong :/")


def process_files():
    # open files
    with open('installed_final.txt', 'r') as final:
        x_final = final.read().split('\n')

    with open('installed.txt', 'r') as inst:
        x_inst = inst.read().split('\n')

    # find packages that needs to be removed
    del_list = []
    for elem in x_inst:
        if elem not in x_final:
            del_list.append(elem)

    # print all packages
    print("List of pkg:")
    [print(ind, elem) for ind, elem in enumerate(del_list)]

    # check if some packages are needed
    not_del = input("Eneter index of pkg NOT to be removed: ")

    # save those packages
    if not_del:
        [del_list.pop(ind) for ind in not_del]

    # create .txt file of packages to be deleted
    print("Saving list of pkg to \'delete_pkg.txt\'")
    with open('delete_pkg.txt', 'w') as f:
        for item in del_list:
            f.write("{}\n".format(item))


def remove():
    # remove
    print("Removing...")
    command = call("yay -Rns $(< delete_pkg.txt)", shell=True)

    if not command:
        # 0 success 1 error
        print("Removed.\nDone!")
    else:
        print("ERORR: Something went wrong while removeing pkg :/")


if __name__ == "__main__":
    create_lst()
    process_files()
    #remove()
