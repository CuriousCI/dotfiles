local config = {
    cmd = {'/home/cicio/.local/share/nvim/mason/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', '*.java'}, { upward = true })[1]),
}
require'jdtls'.start_or_attach(config)
