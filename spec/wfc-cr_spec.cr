require "./spec_helper"

describe "LibWFC" do
  it "should work" do
    image = LibWFC.image_create(5, 5, 1)

    wfc = LibWFC.overlapping(
      128,
      128,
      image,
      3,
      3,
      true,
      true,
      true,
      1
    )

    LibWFC.run(wfc, -1)

    LibWFC.destroy(wfc)
  end
end
