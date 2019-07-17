from .headers.gdnative_api cimport godot_string, godot_object
from .globals cimport gdapi
from ._core cimport _Wrapped


def _pyprint(*objects, sep=' ', end='\n'):
    _gdprint('{0}{1}', sep.join(str(o) for o in objects), end)


def _gdprint(str fmt, *args):
    cdef msg = fmt.format(*args).encode('utf-8')
    cdef const char *c_msg = msg
    cdef godot_string gd_msg

    gdapi.godot_string_new(&gd_msg)
    gdapi.godot_string_parse_utf8(&gd_msg, c_msg)
    gdapi.godot_print(&gd_msg)
    gdapi.godot_string_destroy(&gd_msg)


cdef public _Wrapped _create_wrapper(godot_object *_owner, size_t _type_tag):
    cdef _Wrapped wrapper = _Wrapped.__new__(_Wrapped)
    wrapper._owner = _owner
    wrapper._type_tag = _type_tag
    print('Godot wrapper %s created' % wrapper)
    return wrapper
