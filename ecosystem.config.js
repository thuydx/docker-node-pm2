module.exports = {
    apps: [
        {
            name: "acp",
            script: "npm",
            args: "start",
            cwd: "/usr/src/app",
            instances: "max",
            exec_mode: "cluster",
            watch: false,
            env: {
                NODE_ENV: "production",
                PORT: 3000,
            },
        },
    ],
};
