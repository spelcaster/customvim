if !exists('g:vdebug_options')
    let g:vdebug_options={}
endif

"let g:vdebug_options["ide_key"]="xdebug"

let g:vdebug_options["debug_file"]="/tmp/vdebug.log"
let g:vdebug_options["debug_file_level"]=2

let g:vdebug_options["server"]="172.18.0.1"
let g:vdebug_options["port"]=9003

let g:vdebug_options["break_on_open"]=0
"let g:vdebug_options["path_maps"]={"/app": "/path/to/app"}
