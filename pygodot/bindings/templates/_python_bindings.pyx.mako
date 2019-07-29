# Generated by PyGodot binding generator
<%!
    from pygodot.bindings._generator import python_module_name
%>
from godot_headers.gdnative_api cimport godot_method_bind, godot_gdnative_ext_nativescript_1_1_api_struct
from pygodot.globals cimport gdapi, nativescript_1_1_api, _python_language_index

from pygodot._core cimport _Wrapped


cdef struct __method_bindings:
% for class_name, class_def, includes, forwards, methods in classes:
    % for method_name, method, return_type, pxd_signature, signature, args, return_stmt in methods:
    godot_method_bind *__${class_name}__mb_${method_name}
    % endfor
% endfor

cdef __method_bindings __mb
% for class_name, class_def, includes, forwards, methods in classes:


cdef class ${class_name}(${class_def['base_class'] or '_Wrapped'}):
    pass

% endfor


cdef public void __init_python_method_bindings():
% for class_name, class_def, includes, forwards, methods in classes:
    % for method_name, method, return_type, pxd_signature, signature, args, return_stmt in methods:
    __mb.__${class_name}__mb_${method_name} = gdapi.godot_method_bind_get_method("${class_def['name']}", "${method_name}")
    % endfor
% endfor


cdef public void __register_python_types():
    cdef int i = _python_language_index
    cdef const godot_gdnative_ext_nativescript_1_1_api_struct *ns11api = nativescript_1_1_api

    print("Python language index", i)

% for class_name, class_def, includes, forwards, methods in classes:
    ns11api.godot_nativescript_set_global_type_tag(i, "${class_def['name']}", <const void *>${class_name})
% endfor
