const std = @import("std");

const Humans = struct {
    age: usize,
    name: [6]u8,
    salary: f32,
};

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    var ptr = try allocator.create(Humans);
    defer allocator.destroy(ptr);

    ptr.age = 35;
    _ = try std.fmt.bufPrint(&ptr.name, "Steve", .{});
    ptr.salary = 100.00;

    std.debug.print(
        "Age: {}\nName: {s}\nSalary: {d:.2}\n",
        .{ ptr.age, ptr.name, ptr.salary },
    );

    ptr.age = 40;
    _ = try std.fmt.bufPrint(&ptr.name, "Bill", .{});
    ptr.salary = 1000.00;

    std.debug.print(
        "Age: {}\nName: {s}\nSalary: {d:.2}\n",
        .{ ptr.age, ptr.name, ptr.salary },
    );
}
