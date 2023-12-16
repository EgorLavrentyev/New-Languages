use std::fs::File; 
use std::io::{self, Read, Write}; 
 
fn main() -> io::Result<()> { 

    let input_file_path = "resources//input.bin"; 
    let output_file_path = "resources//output.bin"; 
 
    // Open input file
    let mut input_file = File::open(input_file_path)?; 
 
    // Read bytes form input file
    let mut bytes = Vec::new(); 
    input_file.read_to_end(&mut bytes)?; 
 
    // Write bytes to console
    println!("Bytes read from input file: {:?}", bytes); 

    // Also in hex format
    print!("Hex format: "); 

    for byte in &bytes {
        print!("0x{:02X} ", byte);
    }
    println!();

    // Open output file
    let mut output_file = File::create(output_file_path)?; 
 
    // Reverse bytes
    bytes.reverse(); 

    //Write reversed bytes to input file
    output_file.write_all(&bytes)?; 
    println!();

    // Write result to console 
    println!("Bytes written to output file: {:?}", bytes); 
    print!("Hex format: "); 

    for byte in &bytes {
        print!("0x{:02X} ", byte);
    }
    println!();

    Ok(()) 
}
