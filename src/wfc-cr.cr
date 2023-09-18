@[Link("wfc")]
lib WFC
  VERSION = "0.7"

  DIRECTION_STRINGS = ["up", "down", "left", "right"] of LibC::Char

  enum Direction
    Up    = 0
    Down  = 1
    Left  = 2
    Right = 3
  end

  enum Method
    Overlapping = 0
    Tiled       = 1
  end

  struct Image
    data : LibC::UChar*
    component_cnt : LibC::Int
    width : LibC::Int
    height : LibC::Int
  end

  struct Tile
    image : Image*
    freq : LibC::Int
  end

  struct Cell
    tiles : LibC::Int*
    tile_cnt : LibC::Int
    sum_freqs : LibC::Int
    entropy : LibC::Double
  end

  struct Prop
    src_cell_idx : LibC::Int
    dst_cell_idx : LibC::Int
    direction : Direction
  end

  struct WFC
    method : Method
    seed : LibC::UInt

    image : Image*
    tile_width : LibC::Int
    tile_height : LibC::Int
    expand_input : LibC::Int
    xflip_tiles : LibC::Int
    yflip_tiles : LibC::Int
    rotate_tiles : LibC::Int
    tiles : Tile*
    tile_cnt : LibC::Int
    sum_freqs : LibC::Int

    output_width : LibC::Int
    output_height : LibC::Int
    cells : Cell*
    cell_cnt : LibC::Int

    props : Prop*
    prop_cnt : LibC::Int
    prop_idx : LibC::Int

    collapsed_cell_cnt : LibC::Int

    allowed_tiles : LibC::Int[4]*
  end

  fun init = wfc_init(wfc : WFC*) : Void
  fun run = wfc_run(wfc : WFC*, max_collapse_cnt : LibC::Int) : LibC::Int
  fun export = wfc_export(wfc : WFC*, filename : LibC::Char*) : LibC::Int
  fun destroy = wfc_destroy(wfc : WFC*) : Void
  fun print_prop = wfc__print_prop(p : Prop*, prefix : LibC::Char*) : Void
  fun print_props = wfc__print_props(p : Prop*, prop_cnt : LibC::Int, prefix : LibC::Char*) : Void
  fun image_save = wfc_img_save(image : Image*, filename : LibC::Char*) : LibC::Int
  fun image_load = wfc_img_load(filename : LibC::Char*) : Image*
  fun image_copy = wfc_img_copy(image : Image*) : Image*
  fun image_create = wfc_img_create(width : LibC::Int, height : LibC::Int, component_cnt : LibC::Int) : Image*
  fun image_destroy = wfc_img_destroy(image : Image*) : Void
  fun image_expand = wfc__img_expand(image : Image*, xexp : LibC::Int, yexp : LibC::Int) : Image*
  fun image_compare_overlap = wfc__img_cmpoverlap(a : Image*, b : Image*, direction : Direction) : LibC::Int
  fun image_flip_horizontally = wfc__img_flip_horizontally(image : Image*) : Image*
  fun image_flip_vertically = wfc__img_flip_vertically(image : Image*) : Image*
  fun image_rotate_90 = wfc__img_rotate90(image : Image*, n : LibC::Int) : Image*
  fun image_compare = wfc__img_cmp(a : Image*, b : Image*) : LibC::Int
  fun nofunc_int = wfc__nofunc_int(func_name : LibC::Char*, msg : LibC::Char*, ...) : LibC::Int
  fun nofunc_pointer = wfc__nofunc_ptr(func_name : LibC::Char*, msg : LibC::Char*, ...) : Void*
  fun destroy_cells = wfc_destroy_cells(cells : LibC::Int*) : Void
  fun cells = wfc_cells(wfc : WFC*) : LibC::Int
  fun output_image = wfc_output_image(wfc : WFC*) : Image*
  fun export = wfc_export(wfc : WFC*, filename : LibC::Char*) : LibC::Int
  fun export_tiles = wfc_export_tiles(wfc : WFC*, path : LibC::Char*) : LibC::Int
  fun create_tile_image = wfc__create_tile_image(image : Image*, x : LibC::Int, y : LibC::Int, tile_width : LibC::Int, tile_height : LibC::Int) : Image*
  fun add_overlapping_images = wfc__add_overlapping_images(tiles : Tile*, image : Image*, xcnt : LibC::Int, ycnt : LibC::Int, tile_width : LibC::Int, tile_height : LibC::Int) : LibC::Int
  fun add_flipped_images = wfc__add_flipped_images(tiles : Tile*, tile_idx : LibC::Int, flip_direction : LibC::Int) : LibC::Int
  fun add_rotated_images = wfc__add_rotated_images(tiles : Tile*, tile_idx : LibC::Int) : LibC::Int
  fun remove_duplicate_tiles = wfc__remove_duplicate_tiles(tiles : Tile**, tile_cnt : LibC::Int*) : LibC::Int
  fun create_props = wfc__create_props(cell_cnt : LibC::Int) : Prop*
  fun create_cells = wfc__create_cells(cell_cnt : LibC::Int, tile_cnt : LibC::Int) : Cell*
  fun create_tiles = wfc__create_tiles(tile_cnt : LibC::Int) : Tile*
  fun create_allowed_tiles = wfc__create_allowed_tiles(allowed_tiles : LibC::Int[4]*, tile_cnt : LibC::Int) : LibC::Int
  fun destroy_props = wfc__destroy_props(props : Prop*) : Void
  fun destroy_cells = wfc__destroy_cells(cells : Cell*, cell_cnt : LibC::Int) : Void
  fun destroy_tiles = wfc__destroy_tiles(tiles : Tile*, tile_cnt : LibC::Int) : Void
  fun destroy_allowed_tiles = wfc__destroy_allowed_tiles(allowed_tiles : LibC::Int[4]*) : Void
  fun add_prop = wfc__add_prop(wfc : WFC*, src_cell_idx : LibC::Int, dst_cell_idx : LibC::Int, direction : Direction) : Void
  fun add_prop_up = wfc__add_prop_up(wfc : WFC*, src_cell_idx : LibC::Int) : Void
  fun add_prop_down = wfc__add_prop_down(wfc : WFC*, src_cell_idx : LibC::Int) : Void
  fun add_prop_left = wfc__add_prop_left(wfc : WFC*, src_cell_idx : LibC::Int) : Void
  fun add_prop_right = wfc__add_prop_right(wfc : WFC*, src_cell_idx : LibC::Int) : Void
  fun tile_enabled = wfc__tile_enabled(wfc : WFC*, tile_idx : LibC::Int, cell_idx : LibC::Int, d : Direction) : LibC::Int
  fun is_prop_pending = wfc__is_prop_pending(wfc : WFC*, cell_idx : LibC::Int, d : Direction) : LibC::Int
  fun propagate_prop = wfc__propagate_prop(wfc : WFC*, p : Prop*) : LibC::Int
  fun propagate = wfc__propagate(wfc : WFC*, cell_idx : LibC::Int) : LibC::Int
  fun collapse = wfc__collapse(wfc : WFC*, cell_idx : LibC::Int) : LibC::Int
  fun next_cell = wfc__next_cell(wfc : WFC*) : LibC::Int
  fun init_cells = wfc__init_cells(wfc : WFC*) : Void
  fun compute_allowed_tiles = wfc__compute_allowed_tiles(allowed_tiles : LibC::Int[4]*, tiles : Tile*, tile_cnt : LibC::Int) : Void
  fun create_tiles_overlapping = wfc__create_tiles_overlapping(
    tile_width : LibC::Int,
    tile_height : LibC::Int,
    expand_image : LibC::Int,
    xflip_tiles : LibC::Int,
    yflip_tiles : LibC::Int,
    rotate_tiles : LibC::Int,
    tile_cnt : LibC::Int*
  ) : Tile*
  fun overlapping = wfc_overlapping(
    output_width : LibC::Int,
    output_height : LibC::Int,
    image : Image*,
    tile_width : LibC::Int,
    tile_height : LibC::Int,
    expand_input : Bool,
    xflip_tiles : Bool,
    yflip_tiles : Bool,
    rotate_tiles : LibC::Int
  ) : WFC*
end
