# ☁️ Étape 4 — Détecter la virtualisation (VM)

1. Indices CPU d’un hyperviseur :
```bash
lscpu | grep -i hypervisor || echo "Pas d'hyperviseur détecté"
```

👉 S’il existe, tu es probablement dans une **VM** (KVM, Hyper-V…).

2. Messages noyau liés à la virtualisation :

```bash
sudo dmesg | grep -i virtual | head -n 10 || true
```

👉 Cherche `Virtual`, `KVM`, `VMware`, `VBOX` : ce sont des **signatures de VM**.

3. Modules liés à la virtualisation :

```bash
lsmod | grep -i virt || true
```

👉 `kvm`, `virtio*`, `vbox*`… autant de signes d’un environnement **virtualisé**.
👉 Si rien ne ressort, c’est **pas anormal** : sur des images minimalistes, les modules “virt*” (ex: virtio) ne sont pas forcément listés ou nommés comme on s’y attend. Le fait que `lscpu` et `dmesg` confirment KVM suffit.

🎯 Conclusion : si tu vois hyperviseur/modules/msgs VM → tu es en **Machine Virtuelle**, idéale pour apprendre.

💬 Avantage : tu peux **expérimenter sans casser ton PC**.
C’est pour cela que les labs Formip et Killercoda utilisent des VMs :
elles permettent d’apprendre, tester, réinitialiser… sans risque ! 🧱🔁