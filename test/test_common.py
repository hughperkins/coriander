clang_path = 'clang++-3.8'


def mangle(name, param_types):
    mangled = '_Z%s%s' % (len(name), name)
    for param in param_types:
        if param.replace(' ', '') == 'float*':
            mangled += 'Pf'
        elif param.replace(' ', '') == 'int*':
            mangled += 'Pi'
        elif param.replace(' ', '') == 'int':
            mangled += 'i'
        elif param.replace(' ', '') == 'float':
            mangled += 'f'
        elif param.endswith('*'):
            # assume pointer to struct
            param = param.replace(' ', '').replace('*', '')
            mangled += 'P%s%s' % (len(param), param)
        else:
            raise Exception('not implemented %s' % param)
    return mangled
