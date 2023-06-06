import sum from "../src";

describe("sum", () => {
    it("2+2=4", () => {
        expect(sum(2, 2)).toEqual(4);
    });
});
