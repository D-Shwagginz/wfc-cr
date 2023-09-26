require "./spec_helper"

describe "WFC" do
  it "should work" do
    image = WFC.image_create(5, 5, 1)

    wfc = WFC.overlapping(
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

    WFC.run(wfc, -1)

    WFC.destroy(wfc)
  end
end
