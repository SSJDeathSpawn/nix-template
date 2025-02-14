{
    description = ''
    Nix-templates for personal use
    '';
    outputs = {self}: {
        templates = {
            c = {
                path = ./c;
                description = "C template meson for src as default";
            };
            rust = {
                path = ./rust;
                description = "Rust template for cargo and rust-analyzer";
            };
        };
        defaultTemplate = self.templates.c;
    };
}
