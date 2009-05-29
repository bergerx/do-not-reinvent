indent_level = 0
def tracer(message):
    print "\033[01;30m%s\033[0;37;00m" % message

def trace(fn):
    def newfn(*args, **kwargs):
        fn_params = ""
        if (args):
            fn_params = ",".join([repr(x) for x in args[1:]])
        if (kwargs):
            fn_params += "," + ",".join(["%s=%s" % (k,repr(v)) for k,v in kwargs])
        globals()["indent_level"] += 1
        indent = globals()["indent_level"] * "\t"
        tracer("%s > %s(%s)" % (indent, fn.func_name, fn_params))
        result = fn(*args, **kwargs)
        tracer("%s < %s result: %s" % (indent, fn.func_name, result))
        globals()["indent_level"] -= 1
        return result
    return newfn
