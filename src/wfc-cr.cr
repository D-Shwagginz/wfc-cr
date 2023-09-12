@[Link("wfc")]
lib WFC
  VERSION = "0.0.1"

  WFC_DIRECTION_STRINGS = ["up", "down", "left", "right"] of LibC::Char

  enum WfcDirection
    WfcUp    = 0
    WfcDown  = 1
    WfcLeft  = 2
    WfcRight = 3
  end

  Directions = [
    WfcDirection::WfcUp.value,
    WfcDirection::WfcDown.value,
    WfcDirection::WfcLeft.value,
    WfcDirection::WfcRight.value,
  ] of LibC::Int

  enum WfcMethod
    Overlapping = 0
    Tiled       = 1
  end

  struct WfcImage
    data : LibC::UChar*
    component_cnt : LibC::Int
    width : LibC::Int
    height : LibC::Int
  end

  struct WfcTile
    image : WfcImage*
    freq : LibC::Int
  end

  struct WfcCell
    tiles : LibC::Int*
    tile_cnt : LibC::Int
    sum_freqs : LibC::Int
    entropy : LibC::Double
  end

  struct WfcProp
    src_cell_idx : LibC::Int
    dst_cell_idx : LibC::Int
    direction : WfcDirection
  end

  struct Wfc
    method : WfcMethod
    seed : LibC::UInt

    image : WfcImage*
    tile_width : LibC::Int
    tile_height : LibC::Int
    expand_input : LibC::Int
    xflip_tiles : LibC::Int
    yflip_tiles : LibC::Int
    rotate_tiles : LibC::Int
    tiles : WfcTile*
    tile_cnt : LibC::Int
    sum_freqs : LibC::Int

    output_width : LibC::Int
    output_height : LibC::Int
    cells : WfcCell*
    cell_cnt : LibC::Int

    props : WfcProp*
    prop_cnt : LibC::Int
    prop_idx : LibC::Int

    collapsed_cell_cnt : LibC::Int

    allowed_tiles : LibC::Int[4]*
  end

  fun init = wfc_init(wfc : Wfc*) : Void
  fun run = wfc_run(wfc : Wfc*, max_collapse_cnt : LibC::Int) : LibC::Int
  fun export = wfc_export(wfc : Wfc*, filename : LibC::Char*) : LibC::Int
  fun destroy = wfc_destroy(wfc : Wfc*) : Void
  fun print_prop = wfc__print_prop(p : WfcProp*, prefix : LibC::Char*) : Void
  fun print_props = wfc__print_props(p : WfcProp*, prop_cnt : LibC::Int, prefix : LibC::Char*) : Void
  fun image_save = wfc_img_save(image : WfcImage*, filename : LibC::Char*) : LibC::Int
  fun image_load = wfc_img_load(filename : LibC::Char*) : WfcImage*
  fun image_copy = wfc_img_copy(image : WfcImage*) : WfcImage*
  fun image_create = wfc_img_create(width : LibC::Int, height : LibC::Int, component_cnt : LibC::Int) : WfcImage*
  fun image_destroy = wfc_img_destroy(image : WfcImage*) : Void
  fun image_expand = wfc__img_expand(image : WfcImage*, xexp : LibC::Int, yexp : LibC::Int) : WfcImage*
  fun image_compare_overlap = wfc__img_cmpoverlap(a : WfcImage*, b : WfcImage*, direction : WfcDirection) : LibC::Int
  fun image_flip_horizontally = wfc__img_flip_horizontally(image : WfcImage*) : WfcImage*
  fun image_flip_vertically = wfc__img_flip_vertically(image : WfcImage*) : WfcImage*
  fun image_rotate_90 = wfc__img_rotate90(image : WfcImage*, n : LibC::Int) : WfcImage*
  fun image_compare = wfc__img_cmp(a : WfcImage*, b : WfcImage*) : LibC::Int
  fun nofunc_int = wfc__nofunc_int(func_name : LibC::Char*, msg : LibC::Char*, ...) : LibC::Int
  fun nofunc_pointer = wfc__nofunc_ptr(func_name : LibC::Char*, msg : LibC::Char*, ...) : Void*
  fun destroy_cells = wfc_destroy_cells(cells : LibC::Int*) : Void
  fun cells = wfc_cells(wfc : Wfc*) : LibC::Int
  fun output_image = wfc_output_image(wfc : Wfc*) : WfcImage*
  fun export = wfc_export(wfc : Wfc*, filename : LibC::Char*) : LibC::Int
  fun export_tiles = wfc_export_tiles(wfc : Wfc*, path : LibC::Char*) : LibC::Int
  fun create_tile_image = wfc__create_tile_image(image : WfcImage*, x : LibC::Int, y : LibC::Int, tile_width : LibC::Int, tile_height : LibC::Int) : WfcImage*
  fun add_overlapping_images = wfc__add_overlapping_images(tiles : WfcTile*, image : WfcImage*, xcnt : LibC::Int, ycnt : LibC::Int, tile_width : LibC::Int, tile_height : LibC::Int) : LibC::Int
  fun add_flipped_images = wfc__add_flipped_images(tiles : WfcTile*, tile_idx : LibC::Int, flip_direction : LibC::Int) : LibC::Int
  fun add_rotated_images = wfc__add_rotated_images(tiles : WfcTile*, tile_idx : LibC::Int) : LibC::Int
  fun remove_duplicate_tiles = wfc__remove_duplicate_tiles(tiles : WfcTile**, tile_cnt : LibC::Int*) : LibC::Int
  fun create_props = wfc__create_props(cell_cnt : LibC::Int) : WfcProp*
  fun create_cells = wfc__create_cells(cell_cnt : LibC::Int, tile_cnt : LibC::Int) : WfcCell*
  fun create_tiles = wfc__create_tiles(tile_cnt : LibC::Int) : WfcTile*
  fun create_allowed_tiles = wfc__create_allowed_tiles(allowed_tiles : LibC::Int[4]*, tile_cnt : LibC::Int) : LibC::Int
  fun destroy_props = wfc__destroy_props(props : WfcProp*) : Void
  fun destroy_cells = wfc__destroy_cells(cells : WfcCell*, cell_cnt : LibC::Int) : Void
  fun destroy_tiles = wfc__destroy_tiles(tiles : WfcTile*, tile_cnt : LibC::Int) : Void
  fun destroy_allowed_tiles = wfc__destroy_allowed_tiles(allowed_tiles : LibC::Int[4]*) : Void
  fun add_prop = wfc__add_prop(wfc : Wfc*, src_cell_idx : LibC::Int, dst_cell_idx : LibC::Int, direction : WfcDirection) : Void
  fun add_prop_up = wfc__add_prop_up(wfc : Wfc*, src_cell_idx : LibC::Int) : Void
  fun add_prop_down = wfc__add_prop_down(wfc : Wfc*, src_cell_idx : LibC::Int) : Void
  fun add_prop_left = wfc__add_prop_left(wfc : Wfc*, src_cell_idx : LibC::Int) : Void
  fun add_prop_right = wfc__add_prop_right(wfc : Wfc*, src_cell_idx : LibC::Int) : Void
  fun tile_enabled = wfc__tile_enabled(wfc : Wfc*, tile_idx : LibC::Int, cell_idx : LibC::Int, d : WfcDirection) : LibC::Int
  fun is_prop_pending = wfc__is_prop_pending(wfc : Wfc*, cell_idx : LibC::Int, d : WfcDirection) : LibC::Int
  fun propagate_prop = wfc__propagate_prop(wfc : Wfc*, p : WfcProp*) : LibC::Int
  fun propagate = wfc__propagate(wfc : Wfc*, cell_idx : LibC::Int) : LibC::Int
  fun collapse = wfc__collapse(wfc : Wfc*, cell_idx : LibC::Int) : LibC::Int
  fun next_cell = wfc__next_cell(wfc : Wfc*) : LibC::Int
  fun init_cells = wfc__init_cells(wfc : Wfc*) : Void
  fun compute_allowed_tiles = wfc__compute_allowed_tiles(allowed_tiles : LibC::Int[4]*, tiles : WfcTile*, tile_cnt : LibC::Int) : Void
  fun create_tiles_overlapping = wfc__create_tiles_overlapping(
    tile_width : LibC::Int,
    tile_height : LibC::Int,
    expand_image : LibC::Int,
    xflip_tiles : LibC::Int,
    yflip_tiles : LibC::Int,
    rotate_tiles : LibC::Int,
    tile_cnt : LibC::Int*
  ) : WfcTile*
  fun overlapping = wfc_overlapping(
    output_width : LibC::Int,
    output_height : LibC::Int,
    image : WfcImage*,
    tile_width : LibC::Int,
    tile_height : LibC::Int,
    expand_input : LibC::Int,
    xflip_tiles : LibC::Int,
    yflip_tiles : LibC::Int,
    rotate_tiles : LibC::Int
  ) : Wfc*
end
