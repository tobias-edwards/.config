function command_exists {
    local name=$1
    # NOTE: Return status from a shell function is the return status of the last statement executed
    type $name &> /dev/null

}

if command_exists brew; then
    echo "brew exists?"
else
    echo "brew not exists!"
fi

if command_exists brewww; then
    echo "brewww exists!"
else
    echo "brewww not exists!"
fi
