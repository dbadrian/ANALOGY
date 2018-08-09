import os
import sys

def load_data_file(path, data_file):
    with open(os.path.join(path, data_file)) as f:
        return zip(*(line.strip().split('\t') for line in f))

def write_list(data, path, fname):
    with open(os.path.join(path, fname), 'w') as f:
        for item in data:
            f.write(item+'\n')

def main():
    folder = sys.argv[1]

    data = {
        "train": list(load_data_file(folder, "train.txt")),
        "valid": list(load_data_file(folder, "valid.txt")),
        "test": list(load_data_file(folder, "test.txt")),
    }


    heads = set(data["train"][0]) | set(data["valid"][0]) | set(data["test"][0])
    tails = set(data["train"][2]) | set(data["valid"][2]) | set(data["test"][2])
    entities = heads | tails
    relations = set(data["train"][1]) | set(data["valid"][1]) | set(data["test"][1])

    write_list(list(entities), folder, "entities.txt")
    write_list(list(relations), folder, "relations.txt")


if __name__ == "__main__":
    main()