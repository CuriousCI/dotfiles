#!/usr/bin/fish

fish_add_path /usr/local/cuda-12.4/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/projects/node-v22.14.0-linux-x64/bin
fish_add_path $HOME/projects/prover9-mace4/LADR-2009-11A/bin/

set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda-12.4/lib64

set fish_color_error white
set fish_greeting ""

source $HOME/.cargo/env.fish

function fish_prompt 
    echo (set_color yellow)(whoami)@(hostname) (basename "$(pwd)")(set_color normal)" "
end

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end
