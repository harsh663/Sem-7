#define ll unsigned long long int
static ll a = 56;
static ll q = 34568357;
ll power(ll msg, ll key, ll modulas)
{
    ll ans = 1;
    for (ll i = 0; i < key; i++)
        ans = (msg * ans) % modulas;
    return ans;
}
typedef struct
{
    char name[10];
    ll publicKey;
} publicKeyInformation;
ll findPublicKey(ll privateKey)
{
    return power(a, privateKey, q);
}
ll findSessionKey(ll privateKey, ll publicKey)
{
    return power(publicKey, privateKey, q);
}
ll encryption(ll message, ll key)
{
    uint8_t keyI, msgI, iv, ctI;
    ll cipher = 0;
    iv = a % 256;
    printf("\t\tEncryption Process: plain=%2llx\tkey=%2llx\tIV0:%2x\n", message,
           key, iv);
    for (int i = 0; i < 4; i++)
    {
        keyI = (uint8_t)((key & (255 << (8 * i))) >> (8 * i));
        msgI = (uint8_t)((message & (255 << (8 * i))) >> (8 * i));
        if (i)
            ctI = ctI ^ keyI ^ msgI;
        else
            ctI = iv ^ keyI ^ msgI;
        cipher = cipher | (ctI << 8 * i);
    }
    return cipher;
}
ll decryption(ll cipher, ll key)
{
    uint8_t keyI, ptI, iv, ctI, ctI_1 = 0;
    ll plain = 0;
    iv = a % 256;
    printf("\t\tDecryption Process: cipher=%2llx\tkey=%2llx\tIV0:%2x\n", cipher,
           key, iv);
    for (int i = 0; i < 4; i++)
    {
        keyI = (uint8_t)((key & (255 << (8 * i))) >> (8 * i));
        ctI = (uint8_t)((cipher & (255 << (8 * i))) >> (8 * i));
        if (i)
            ptI = ctI_1 ^ keyI ^ ctI;
        else
            ptI = iv ^ keyI ^ ctI;
        plain = plain | (ptI << 8 * i);
        ctI_1 = ctI;
    }
    return plain;
}
