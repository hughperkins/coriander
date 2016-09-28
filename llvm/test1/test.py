import clang.cindex


clang.cindex.Config.set_library_path('/usr/lib/llvm-3.8/lib')
index = clang.cindex.Index.create()
print(index)
# help(index)


def walk(node, indent=1):
    if node.location.file is not None and node.location.file.name != 'foo.cpp':
        return
    print(' ' * indent, node.location, node.kind, node.spelling)
    for child in node.get_children():
        walk(child, indent=indent + 1)

tu = index.parse('foo.cpp')
print('tu', tu)
walk(tu.cursor)
# help(tu)
