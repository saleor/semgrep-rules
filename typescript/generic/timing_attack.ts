import crypto from "crypto";

const originalSignature = "...";
const body = "...";

const hash = crypto
  .createHmac("sha512", "my-secret")
  .update(body)
  .digest("hex");

const validSignature = `sha512=${hash.toUpperCase()}`;

// Should detect when using !==, !=, ===, and ==.
// ruleid: timing-attack-comparison
if (validSignature !== originalSignature) {
  throw new Error("The signature does not match");
}
// ruleid: timing-attack-comparison
if (validSignature != originalSignature) {
  throw new Error("The signature does not match");
}
// ruleid: timing-attack-comparison
if (validSignature === originalSignature) {
  throw new Error("The signature does not match");
}
// ruleid: timing-attack-comparison
if (validSignature == originalSignature) {
  throw new Error("The signature does not match");
}

// Should detect when storing the result into a variable.
// ruleid: timing-attack-comparison
const result = (validSignature === originalSignature);

// It is valid to use crypto.timingSafeEqual().
// ok: timing-attack-comparison
crypto.timingSafeEqual(validSignature, originalSignature)
