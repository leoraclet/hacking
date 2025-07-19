use rand::{rngs::StdRng, RngCore, SeedableRng};

static M: [u8; 16] = [1, 1, 2, 0x91, 1, 2, 0x91, 1, 2, 0x91, 1, 1, 0x91, 1, 1, 2];

pub struct KeyDeriver {
    key: [u8; 16],
    rng: StdRng,
    counter: u8,
    pub tr: [u8; 16],
}

fn multiply(i: u8, j: u8, m: u8) -> u8 {
    let mut a = i;
    let mut b = j;
    let mut p = 0;
    while a != 0 && b != 0 {
        if b & 1 == 1 {
            p ^= a;
        }
        if (a & 0x80) >> 7 == 1 {
            a <<= 1;
            a ^= m;
        } else {
            a <<= 1;
        }
        b >>= 1;
    }
    p
}

impl KeyDeriver {
    pub fn new(key: &[u8; 16], seed: u64) -> KeyDeriver {
        KeyDeriver {
            key: *key,
            rng: StdRng::seed_from_u64(seed),
            counter: 1,
            tr: M,
        }
    }

    pub fn iter(&mut self) -> [u8; 16] {
        self.mix();
        self.counter = (1 + self.counter) % 16;

        self.key
    }

    fn mix(&mut self) {
        let index: usize = (self.rng.next_u32() % 16) as usize;
        for i in 0..4 {
            for j in 0..4 {
                self.key[i * 4 + j] = 0;
                for k in 0..4 {
                    self.key[i * 4 + j] ^=
                        multiply(self.tr[i * 4 + k], self.key[k * 4 + j], 0b1011111);
                }
            }
        }

        if self.tr[index] == self.counter {
            self.swap_tr(self.counter as usize, index);
        }

        for i in 0..4 {
            for j in 0..4 {
                for k in 0..4 {
                    self.tr[i * 4 + j] ^=
                        multiply(self.tr[i * 4 + k], self.tr[k * 4 + j], 0b1011111);
                }
            }
        }
    }

    fn swap_tr(&mut self, i: usize, j: usize) {
        self.tr[i] ^= self.tr[j]; // tr[i] = tr[i] ^ tr[j]
        self.tr[j] ^= self.tr[i]; // tr[j] = tr[i] ^ tr[j] = tr[i] ^ tr[j] ^ tr[j] = tr[i]
        self.tr[i] ^= self.tr[j]; // tr[i] = tr[i] ^ tr[j] = tr[i] ^ tr[j] ^ tr[i] = tr[j]
    }
}
