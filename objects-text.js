const x = [1, 2, 3];

const y = (1, 2, 3);

const z = { a: 1, b: 2, c: 3 };

x = "Alpha";

y = "Beta";

z = `Gamma`;

if (x === 1 && y === 2 && z === 3) {
  console.log("x and y are equal");
}

x.map((item) => console.log(item));
