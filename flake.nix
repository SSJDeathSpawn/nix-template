{
    description = ''
    Nix-templates for personal use
    '';
    outputs = {self}: {
        templates = {
            c-meson = {
                path = ./c-meson;
                description = "C template meson for src as default";
            };
            c-make = {
                path = ./c-make;
                description = "C template for make";
            };
            rust = {
                path = ./rust;
                description = "Rust template for cargo and rust-analyzer";
            };
            python = {
                path = ./python;
                description = "Python 3 template with no installed packages";
            };
        };
        defaultTemplate = self.templates.c;
    };
}
