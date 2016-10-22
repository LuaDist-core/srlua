package = "srlua"
version = "5.2-2"
source = {
    tag = "5.2-2",
    url = "git://github.com/LuaDist-core/srlua.git"
}
description = {
    summary = "A tool for building self-running Lua programs.",
    homepage = "http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/",
    license = "MIT"
}
dependencies = {
    "lua ~= 5.2",
}
build = {
    type = "cmake",
}
