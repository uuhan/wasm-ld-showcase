extern "C" {
    // EXTERN FUNCTION FROM C WORLD
    fn add_in_c_world(x: i32, y: i32) -> i32;

}

// EXPORT FUNCTION
#[no_mangle]
pub fn add_in_rs_world(x: i32, y: i32) -> i32 {
    unsafe { add_in_c_world(x, y) }
}

// WASM ENTRY POINT
#[no_mangle]
pub fn _start() {
    println!("[C] 3 + 4 = {}", add_in_rs_world(3, 4));
}
