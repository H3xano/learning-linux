# ☁️ Étape 4 — Détecter la virtualisation (VM)

Une VM laisse souvent des traces détectables par le noyau et le matériel virtuel.

```bash
lscpu | grep -i hypervisor || echo "no hypervisor"
dmesg | grep -i virtual || true
lsmod | grep -i virt || true
````

👉 Si `hypervisor`, `kvm`, `vbox`, `vmware` ou lignes similaires apparaissent, tu es très probablement dans une VM.
Les VM sont idéales pour apprendre : isolées, réinitialisables et sans risque.

