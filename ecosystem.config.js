module.exports = {
    apps: [
        {
            name: "acp",
            script: "npm",
            args: "run start",
            cwd: "/usr/src/app",
            instances: "max",
            exec_mode: "cluster",
            watch: false,
            autorestart: true,
            env: {
                NODE_ENV: "production",
                PORT: 3000,
                HOST: "0.0.0.0",
            },
        },
    ],
};
