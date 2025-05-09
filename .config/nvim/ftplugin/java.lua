require 'jdtls'.start_or_attach {
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'Main.java' }, { upward = true })[1]),
    settings = {
        java = {
            maven = { downloadSources = true },
            signatureHelp = { enabled = true },
            inlayHints = { parameterNames = { enabled = 'all' } },
        }
    }
}
