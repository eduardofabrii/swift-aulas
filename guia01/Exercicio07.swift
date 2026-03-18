var nomeOpcional: String? = "Eduardo"

if let nome = nomeOpcional {
    print("O nome é: \(nome)")
} else {
    print("O nome não está definido.")
}

// guard let nomeGuard = nomeOpcional else {
//     print("O nome não está definido.")
//     return
// }
print("O nome é: \(nomeOpcional ?? "Nome não definido")")